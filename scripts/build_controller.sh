#!/bin/bash
set -e

#
# Prepare controller module
#
# Usage: scripts/build_controller.sh <profile_name> <profile_code> <profile_dir> <module_dir> from the profile main directory.
#

codeprepare () {
  INPUT=$1
  echo "${INPUT}" | tr A-Z a-z | sed -e 's/[^a-zA-Z0-9\-]/_/g'
}

profile_name_def="LN"
PROFILE_NAME=${1:-${profile_name_def}}

profile_code_def=$( codeprepare "${PROFILE_NAME}" )
PROFILE_CODE=${2:-${profile_code_def}}
PROFILE_DIR=${3:-profiles/${PROFILE_CODE}}
PROFILE_INFO=${PROFILE_DIR}/${PROFILE_CODE}.info
MODULE_DIR=${4:-tmp/modules/custom}

if [ -d $MODULE_DIR ]; then
  mkdir -p $MODULE_DIR
fi

if [ -d controller_tmpl ] && [ -d controller_tmpl/tmpl_controller ]; then

  rm -rf controller_tmp
  cp -r controller_tmpl controller_tmp

  for tmpl_module in 'deploy_content' 'controller'
  do
    if [ ! -d sites_all/modules/custom/${PROFILE_CODE}_${tmpl_module} ]; then
      echo "Preparing ${tmpl_module} module for ${PROFILE_CODE}..."
      cd controller_tmp/tmpl_${tmpl_module}

      for file in *
      do
        sed -e "s?{PROFILE_NAME}?${PROFILE_NAME}?g" --in-place "$file"
        sed -e "s?{PROFILE_CODE}?${PROFILE_CODE}?g" --in-place "$file"
      done

      for file in tmpl_*
      do
        if [ ! -f "${PROFILE_CODE}_${file#tmpl_}" ]; then
          mv "$file" "${PROFILE_CODE}_${file#tmpl_}"
        fi
      done

      cd ../..

      echo "Creating ${tmpl_module} module for ${PROFILE_CODE}..."
      mv controller_tmp/tmpl_${tmpl_module} $MODULE_DIR/${PROFILE_CODE}_${tmpl_module}

      echo $PROFILE_INFO
      if [ -f $PROFILE_INFO ]; then
        DEPENDENCY=`grep -n "^[ ]*dependencies[ ]*\[\][ ]*=[ ]*${PROFILE_CODE}_${tmpl_module}[ ]*$" $PROFILE_INFO | cut -f1 -d: | head -n 1`
        if [ ! $DEPENDENCY ]; then
          DEPENDENCY_TEXT="dependencies[] = ${PROFILE_CODE}_${tmpl_module}"
          echo "add dependency for ${PROFILE_CODE}_${tmpl_module}"
          echo >> $PROFILE_INFO
          echo >> $PROFILE_INFO
          echo "; Install ${tmpl_module} module" >> $PROFILE_INFO
          echo $DEPENDENCY_TEXT >> $PROFILE_INFO
          echo "Dependency for ${tmpl_module} module inserted in ${PROFILE_INFO}"
        fi
      fi
    fi
  done

  rm -rf controller_tmp
fi
