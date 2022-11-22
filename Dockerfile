# docker run -d -p 80:80 nginx
FROM nginx
#who is creating it
LABEL MAINTAINER=eng130-angel
# created index.html profile -> copy to container
# default location -> usr/share/nginx/html/
COPY index.html /usr/share/nginx/html/
# commit
# push
# docker run -d -p 80:80 name
# 	launch nginx
#	port number must be specified
EXPOSE 80

#launch server
CMD ["nginx", "-g", "daemon off;"]
