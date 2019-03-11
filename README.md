# rake-finxos-institute-miaotu
> Special task institute-miaotu project.

## install:
```bash
# dependencies:
npm i -D afeiship/rake-weapp --registry=https://registry.npm.taobao.org
npm i -D afeiship/rake-finxos-institute-miaotu --registry=https://registry.npm.taobao.org
```

## usage:
~~~
$ rake -T
rake app:build[theme,inst,env]  # Special task institute-miaotu project
rake app:icons[url,filename]    # Sync iconfonts
rake app:reset[theme,inst]      # Reset project
~~~


## todos:
- [] add cli support;
- [] add app:reset cmd

~~~
weapp-cli -u 0.1.21@/Users/feizheng/finxos/institute-miaotu --upload-desc '[v0.1.21][2019-03-06] MSG'
~~~