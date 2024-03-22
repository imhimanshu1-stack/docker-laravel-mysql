Laravel Application Deployment using Docker
===========================================

This repository contains the necessary Docker configuration to deploy a Laravel application using Docker and Docker Compose. It includes a `Dockerfile` for building the Laravel application's Docker image and a `docker-compose.yml` file for setting up the application and its services, including MySQL.

Prerequisites
-------------

Before you begin, ensure you have Docker and Docker Compose installed on your system. If you haven't, you can download them from the official Docker website:

-   Docker: https://docs.docker.com/get-docker/
-   Docker Compose: https://docs.docker.com/compose/install/

Configuration
-------------

1.  Clone this repository to your local machine using the following command:

    bashCopy code

    `git clone https://github.com/imhimanshu1-stack/docker-laravel-mysql.git`

2.  Navigate into the cloned directory:

    bashCopy code

    `cd docker-laravel-mysql`

3.  Update the `.env` file with your application's environment variables, including the database connection details. If an `.env` file does not exist, you may copy `.env.example` to `.env` and update the values accordingly.

Deployment
----------

To deploy your Laravel application using Docker and Docker Compose, follow these steps:

1.  Build the Docker images:

    Copy code

    `docker-compose build`

2.  Once the build process is complete, start the containers:

    Copy code

    `docker-compose up -d`

3.  After the containers are up and running, you may need to perform the initial Laravel setup. This includes generating the application key and running migrations. You can do this by executing the following commands:

    bashCopy code

    `docker-compose exec app php artisan key:generate
    docker-compose exec app php artisan migrate`

4.  Your Laravel application should now be running and accessible. By default, it will be available at http://localhost:8000. You can change the port by modifying the `docker-compose.yml` file if necessary.

Managing the Application
------------------------

-   Starting the application: `docker-compose up -d`
-   Stopping the application: `docker-compose down`
-   Viewing logs: `docker-compose logs -f`

Customizing the Docker Configuration
------------------------------------

If you need to customize the Docker configuration, you can edit the `Dockerfile` for application-specific settings or the `docker-compose.yml` file for service configurations.

Contributing
------------

We welcome contributions to improve this Docker setup. Please feel free to submit issues or pull requests.

License
-------

This Docker setup for deploying Laravel applications is open-sourced software licensed under the MIT license.
