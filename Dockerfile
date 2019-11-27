FROM golang:1.13.4

MAINTAINER XieWei(1156143589@qq.com)

EXPOSE 8888 8081

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime;\
    echo "Asia/Shanghai" > /etc/timezone;\
    dpkg-reconfigure -f noninteractive tzdata

WORKDIR /go/src/github.com/wuxiaoxiaoshen/go-anything
RUN echo $PWD
COPY . /go/src/github.com/wuxiaoxiaoshen/go-anything

RUN apt-get update && apt-get install -q -y vim nginx  git openssh-client cron && apt-get clean;\
    go mod vendor;\
    make remove;\
    make prod;\
    echo Succeed!
CMD ["bash","-c", "/go/src/github.com/wuxiaoxiaoshen/go-anything/go-anything"]