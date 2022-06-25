# 從https://hub.docker.com/_/gradle?tab=description上抓取image，並命名為gradle stage
# 可以抓取alpine版本(依賴較少的版本)，但6.6.1尚無支援
FROM gradle:6.6.1-jdk8-hotspot AS gradle

# 新增參數VERSION
ARG VERSION
ENV VERSION=${VERSION:-1.0.0}

# 將目前專案的檔案，複製到目的地/home/gradle/src內，並修改src資料夾的使用者/群組權限更名為gradle
COPY --chown=gradle:gradle . /home/gradle/src

# 切換到工作目錄
WORKDIR /home/gradle/src

# 運行Gradle
RUN gradle build --no-daemon -P version=${VERSION}

# 抓取jdk8的運行環境 image
FROM openjdk:8-jdk-alpine AS JDK

# 創建app資料夾
RUN mkdir /app

# 切換到/app的工作資料夾中
WORKDIR /app

# 將gradle stage內，/libs底下所有的jar複製到JDK stage底下，並命名為spring-boot-application.jar
# 注意Spring Boot 2.5.x版本後，會產生兩個jar檔案，要記得處理，參考
# https://stackoverflow.com/questions/67663728/spring-boot-2-5-0-generates-plain-jar-file-can-i-remove-it
COPY --from=gradle /home/gradle/src/build/libs/*.jar spring-boot-application.jar

# 曝露8080 Port
EXPOSE 8080

# 為了縮短Tomcat的啟動時間，因此添加java.security.egd的系統屬性指向/dev/urandom作為ENTRYPOINT
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom","-jar","spring-boot-application.jar"]