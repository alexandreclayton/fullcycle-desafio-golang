# Building App
FROM golang:alpine3.13 AS buildingStage
WORKDIR /usr/src/build_app
COPY app.go .
RUN go build app.go

# Runing App
FROM scratch
WORKDIR /usr/src/app
COPY --from=buildingStage /usr/src/build_app/app .
ENTRYPOINT [ "./app" ]