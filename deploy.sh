# 杀死旧服务
kill -9 $(lsof -i:8081 -t)
# 编译新服务，有不同的用户组，所以写绝对路径
/usr/local/go/bin/go build -o hello
# BUILD_ID这个环境变量是Jenkins（一种自动化服务器软件）中使用的，它唯一标识了一个构建任务
# 设置BUILD_ID为DONTKILLME的目的在于防止Jenkins自动结束或者干涉这个构建任务产生的进程。
# 简单来说，就是告诉Jenkins不要自动杀掉使用BUILD_ID=DONTKILLME变量标识的进程。
BUILD_ID=DONTKILLME
# nohup设置任务在关闭终端之后继续运行，并且输出的日志都写入指定文件中
nohup ./hello > output.log 2>&1 &