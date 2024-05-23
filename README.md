### The precedence of multiple translations for the same literal does not work on Python3.11 & Python3.12

Created ticket at Django Ticket Tracker: https://code.djangoproject.com/ticket/XXXXX

According to [documentation](https://docs.djangoproject.com/en/4.2/topics/i18n/translation/#how-django-discovers-translations)
Django will look for translations in the following order:

* LOCALE_PATHS directories
* 3rd party apps
* django/conf/locale

In my case we build 



### How to run the project:
* `make rebuild` to build the image 
* `make up` to run docker containers
* run then `make shell app` to enter the app container
* and inside that container run `make run` to runserver and open http://0.0.0.0:8000/ in your browser 