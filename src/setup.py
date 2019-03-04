from setuptools import setup, find_packages

setup (
    name                 = 'todobackend',
    version              = '0.1.0',
    description          = 'Todobackend Django REST Service',
    packages              = find_packages(),
    include_package_data = True,
    scripts              = ["manage.py"],
    install_requires     = [ "backports.functools-lru-cache==1.5",
                            "configparser==3.7.1",
                            "Django==1.9",
                            "django-cors-headers==1.1.0",
                            "djangorestframework==3.3.0",
                            "enum34==1.1.6",
                            "futures==3.2.0",
                            "isort==4.3.4",
                            "lazy-object-proxy==1.3.1",
                            "mccabe==0.6.1",
                            "MySQL-python==1.2.5",
                            "pylint==1.9.4",
                            "singledispatch==3.4.0.3",
                            "six==1.12.0",
                            "wrapt==1.11.1",
                            "uwsgi>=2.0"
    ],
    extras_require       = {
                            "test": [
                                "django-nose==1.4.6",
                                "nose==1.3.7",
                                "pinocchio==0.4.2",
                                "coverage==4.5.2",
                                "colorama==0.4.1"
                            ]
    }
)
