# qbit-race-docker
 
Uses [TheCatLady/docker-webhook](https://github.com/TheCatLady/docker-webhook) (a docker image of [adnanh/webhook](https://github.com/adnanh/webhook)) to allow [ckcr4lyf/qbit-race](https://github.com/ckcr4lyf/qbit-race) to be called via webhooks. You can bind mount matching, for example, the path a torrent file would be on in an Autobrr container to this and call the webhook to add it via the webhook action. You can also add the webhooks in Qbittorrent itself to run on torrent add and completion. This also allows for multiple instances of qbit-race to manage many instances of Qbittorrent. 

## Versioning

As this differs a fair bit from the main qbit-race software, a separate versioning system is in place. So v1.0.0 is not v1.0.0 of qbit-race. Additionally, this starts off with the alpha 2.0.0 version. See the changelog for version mappings.

## Configuration

Mount your `config.json` file to `/root/.config/qbit-race/config.json`, or mount a configuration directory to `/root/.config/qbit-race` then run `docker exec qbit-race qbit-race` to generate a default config.

## Available Commands

Note: all query parameters are required since this configuration passes them as numbered arguments. You can set them to the would-be defaults or leave things like `extra-tags` empty

### qbit-race

Everything following "qbit-race" in the regular command.

`http://qbit-race:9000/hooks/qbit-race?command=add -p /tmp/autobrr-xxx -c racing`

### add

`http://qbit-race:9000/hooks/add?path=/tmp/autobrr-xxx&category=racing&tracker-tags=false&extra-tags=a,b,c`

### race

`http://qbit-race:9000/hooks/race?info-hash=123&tracker-tags=false&extra-tags=a,b,c`

### completed

`http://qbit-race:9000/hooks/completed?info-hash=123`

### tag-error

`http://qbit-race:9000/hooks/tag-error?dry-run=false`

## Customization

If you wish to customize `hooks.yml` or the scripts, you can mount your own `hooks.yml` to `/config/hooks.yml` and your own scripts to anywhere (the default used is /var/scripts). Just make sure to reference those script locations in `hooks.yml` according to the [adnanh/webhook](https://github.com/adnanh/webhook) docs. To maintain current function in addition to customizations, copy the hook.yml file from the Github here and add to that.