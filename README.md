### The precedence of multiple translations for the same literal does not work on Python3.11 & Python3.12

Created ticket at Django Ticket Tracker: https://code.djangoproject.com/ticket/35476#ticket

According to [documentation](https://docs.djangoproject.com/en/4.2/topics/i18n/translation/#how-django-discovers-translations)
Django will look for translations in the following order:

* LOCALE_PATHS directories
* 3rd party apps
* django/conf/locale

In my case we build we have translation string 'Continue' which should be translated to 'Weiter',
but it is translated to 'Fortfahren' because the 3rd party library like in my case `django-allauth@0.63.1` [has translation to
'Fortfahren'](https://github.com/pennersr/django-allauth/blob/51ae70ed448b3d86853ea3dd984822e9d6c5d15f/allauth/locale/de/LC_MESSAGES/django.po#L1331)

If you need to confirm, that LOCALE_PATHS directories are working correctly, you can comment at settings.py next line `'allauth',`.


### How to run the project:
* `make rebuild` to build the image 
* `make up` to run docker containers
* run then `make shell app` to enter the app container
* and inside that container run `make run` to runserver and open http://0.0.0.0:8000 in your browser

If you want to check it on Python 3.10 or 3.12, please change at `compose/Dockerfile` FROM statement to needed
version and run all steps again from top (like `make rebuild` etc until you run the server)