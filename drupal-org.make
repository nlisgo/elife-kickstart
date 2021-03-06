; Drupal.org release file.
core = 7.x
api = 2

; contrib modules
projects[devel][version] = 1.5
projects[devel][subdir] = "contrib"
projects[migrate][version] = 2.7
projects[migrate][subdir] = "contrib"
projects[migrate_extras][version] = 2.5
projects[migrate_extras][subdir] = "contrib"
projects[date][version] = 2.8
projects[date][subdir] = "contrib"
projects[context][version] = 3.6
projects[context][subdir] = "contrib"
projects[entity][version] = 1.5
projects[entity][subdir] = "contrib"
projects[token][version] = 1.5
projects[token][subdir] = "contrib"
projects[field_group][version] = 1.4
projects[field_group][subdir] = "contrib"
projects[rules][version] = 2.8
projects[rules][subdir] = "contrib"
projects[libraries][version] = 2.2
projects[libraries][subdir] = "contrib"
projects[module_filter][version] = 2.0-alpha2
projects[module_filter][subdir] = "contrib"
projects[pathauto][version] = 1.2
projects[pathauto][subdir] = "contrib"
projects[entityreference][version] = 1.1
projects[entityreference][subdir] = "contrib"
projects[menu_attributes][version] = 1.0-rc3
projects[menu_attributes][subdir] = "contrib"
projects[imce][version] = 1.9
projects[imce][subdir] = "contrib"
projects[menu_token][version] = 1.0-beta5
projects[menu_token][subdir] = "contrib"
projects[node_clone][version] = 1.0-rc2
projects[node_clone][subdir] = "contrib"
projects[special_menu_items][version] = 2.0
projects[special_menu_items][subdir] = "contrib"
projects[globalredirect][version] = 1.5
projects[globalredirect][subdir] = "contrib"
projects[google_analytics][version] = 2.1
projects[google_analytics][subdir] = "contrib"
projects[delta][version] = 3.0-beta11
projects[delta][subdir] = "contrib"
projects[webform][version] = 4.2
projects[webform][subdir] = "contrib"
projects[xmlsitemap][version] = 2.2
projects[xmlsitemap][subdir] = "contrib"
projects[strongarm][version] = 2.0
projects[strongarm][subdir] = "contrib"
projects[ctools][version] = 1.6
projects[ctools][subdir] = "contrib"
projects[views][version] = 3.10
projects[views][subdir] = "contrib"
projects[metatag][version] = 1.4
projects[metatag][subdir] = "contrib"
projects[scheduler][version] = 1.3
projects[scheduler][subdir] = "contrib"
projects[ckeditor][version] = 1.16
projects[ckeditor][subdir] = "contrib"
projects[views_field_view][version] = 1.1
projects[views_field_view][subdir] = "contrib"
projects[features][version] = 2.3
projects[features][subdir] = "contrib"

; patched modules
projects[redirect][version] = 1.0-rc1
projects[redirect][subdir] = "patched_contrib"
projects[redirect][patch][] = "https://drupal.org/files/issues/redirect.circular-loops.1796596-119.patch"
projects[redirect][patch][] = "https://drupal.org/files/redirect-migrate-support-1116408-69.patch"

; Libraries.

