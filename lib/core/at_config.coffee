AccountsTemplates.configureRoute('signIn')
AccountsTemplates.configureRoute('signUp')
AccountsTemplates.configureRoute('resetPwd')

AccountsTemplates.configure
    enablePasswordChange: false
    showForgotPasswordLink: false
    confirmPassword: false
    overrideLoginErrors: true
    negativeFeedback: false
    positiveFeedback: false
    negativeValidation: true
    positiveValidation: true

Meteor.startup ->
    AccountsTemplates.init()
