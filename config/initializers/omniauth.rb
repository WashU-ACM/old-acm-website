require 'omniauth-openid'
require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :openid, {
    store: OpenID::Store::Filesystem.new('./tmp'),
    name: 'google',
    identifier: 'https://www.google.com/accounts/o8/id'
  }
  provider :shibboleth, {
    shib_session_id_field: "Shib-Session-ID",
    shib_application_id_field: "Shib-Application-ID",
    debug: false,
    uid_field: "wustlEduId",
    name_field: "cn",
    info_fields: {
      email: "email",
      first_name: "givenName",
      last_name: "sn"
    },
    extra_fields: [
      :"affiliation",
      :"eppn",
      :"sAMAccountName",
      :"wustlEduCredId"
    ]
  }
end
