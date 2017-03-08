'use strict'

# =============================================
# Vendors
# =============================================
angular.module("ngFillHeight.vendors", [])

# =============================================
# Modules
# =============================================
# angular.module("ngFillHeight.controllers" , ["ngFillHeight.vendors"])
# angular.module("ngFillHeight.filters"     , ["ngFillHeight.vendors"])
# angular.module("ngFillHeight.factories"   , ["ngFillHeight.vendors"])
angular.module("ngFillHeight.constants"   , ["ngFillHeight.vendors"])
# angular.module("ngFillHeight.services"    , ["ngFillHeight.vendors"])
angular.module("ngFillHeight.directives"  , ["ngFillHeight.vendors"])
angular.module("ngFillHeight.mocks"       , ["ngFillHeight.vendors"])
# angular.module("ngFillHeight.configs"     , ["ngFillHeight.vendors"])
# angular.module("ngFillHeight.providers"   , ["ngFillHeight.vendors"])


# =============================================
# Scripts Module
# =============================================
angular.module("ngFillHeight.scripts", [
  # "ngFillHeight.controllers",
  "ngFillHeight.constants",
  # "ngFillHeight.filters"
  # "ngFillHeight.factories",
  # "ngFillHeight.services",
  "ngFillHeight.directives",
  "ngFillHeight.mocks",
  # "ngFillHeight.providers",
  # "ngFillHeight.configs"
])


# =============================================
# Main Module
# =============================================
angular.module("ngFillHeight", [
  "ngFillHeight.scripts",
  "ngFillHeight.vendors"
])


