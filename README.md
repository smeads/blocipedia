#README

##Blocipedia
Is an application that allows users to create public and private Markdown-based wikis.

### Application Features

#### User Story:
  * A user can sign up for a free account by providing a user name, password and email.
  * A user can sign in and out of Blocipedia.
  * A user has the option to use a free standard account or upgrade to a premium account.
  * A standard account has the ability to create, read, update, and delete public wikis.
  * A premium account has the ability to create private wikis, and add or remove collaborators.
  * A user can edit wikis using Markdown syntax.

#### Authentication with Devise:
Blocipedia incorporates [Devise](https://github.com/plataformatec/devise) for user authentication. The authentication system allows users to sign up and send emails for account confirmation. Additionally, users can sign in and out of Blocipedia.

#### Authorization with Pundit:
Blocipedia uses [Pundit](https://github.com/elabs/pundit) for authorization. There are three roles, standard (free), premium, or admin. When a user signs up the role defaults to standard.

#### Upgrading an Account:
Blocipedia utalizes [Stripe](https://stripe.com/) to charge users before switching their account role from standard to premium. A user can downgrade at anytime.

#### Markdown Capabilities:
Using [Redcarpet](https://github.com/vmg/redcarpet) Blocipedia gives users the ability to use Markdown syntax.

#### Video Walk Through
<iframe width="560" height="315" src="https://www.youtube.com/embed/YslWc2Lvc3E" frameborder="0" allowfullscreen></iframe>

#### Heroku Link
[Blocipedia](https://arcane-depths-91867.herokuapp.com)
