# ProjectSend Docker

This repo contains configuration to add a Docker functionality to ProjectSend in a more service oriented architecture; five apps have been contenerized to enable faster development. `Use this configuration on a prod env at your own risk. `

### Services
| Service                | Stack      | Port | Description                               | Default |
| ---------------------- | :--------- | ---: | :---------------------------------------- |---------|
| mysql                  | mysql 5.7  | 3306 |                                           | Yes     |
| phpmyadmin             | phpmyadmin | 80   | phpmyadmin                                | No      |
| main                   | ProjectSend| 80   | ProjectSend Service running on PHP-fpm    | Yes     |
| mailer                 | MailHog    | 1025/8025   | MailHog as a dummy SMTP server    | No     |
| router                 | NGINX      |   80 / 443 | proxy service for local dev         | Yes     |


##  Routing
| Domain                  | Services                             | Main Routes                
| ----------------------- | :----------------------------------- | :------------------------ |
| main.app.local          | ProjectSend                          | /                         |
| phpmyadmin.app.local    | PhpMyAdmin                           | /                         |
| mailer.app.local        | MailHog Service                      | / <br> /api/*             |

## Setup

- Prerequisites:
  - Have docker installed (v20)
  - Have docker-compose installed (v1.29)
- Add the following records to your comuters  `/etc/hosts` file on local(not in docker)  
  ```
  127.0.0.1       main.app.local
  127.0.0.1       mailer.app.local
  127.0.0.1       phpmyadmin.app.local
  ```

- Copy the contents of `.env.example` into `.env`
    - All services have been defined in the example file and have been set to disabled.
      - `enabled` this run the app on the machine
      - `disabled` This will run a dummy place holder instead of the actual service.
      **NOTE:** Please make sure your account is able to pull the images from the ECR

## Execution
- First step is to modify your local `.env`
- run `docker-compose build` to build all configured services
- once db is restored run `docker-compose start` or `docker-compose up -d`to start docker in daemon mode.


## Notes
- Try to avoid leaving unecessary services running.
- Minimum Ammount of Ram allocated for Docker should be 4GB.
