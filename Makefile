GIT_VER=$(shell git rev-parse --short HEAD)
VER="1.0.1"
APP_VERSION=${VER}.${GIT_VER}
RELEASE="build/release-${APP_VERSION}"
APP_NAME="webtail"
LDFLAGS="-s -w -X main.AppVersion=${APP_VERSION}"

all:
	go build -ldflags ${LDFLAGS}

clean:
	rm -f ${APP_NAME}
	rm -rf build/

release:clean .IGNORE

.IGNORE:
	mkdir -p ${RELEASE}
	#linux
	CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-386.tar.gz" ${APP_NAME}
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-amd64.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=6 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-arm-v6.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 GOARM=6 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-arm64-v6.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=7 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-arm-v7.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 GOARM=7 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-arm64-v7.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=5 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-arm-v5.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 GOARM=5 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-arm64-v5.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=mips go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-mips.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=mips64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-mips64.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=mips64le go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-mips64le.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=mipsle go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-mipsle.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=ppc64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-ppc64.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=ppc64le go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-ppc64le.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=linux GOARCH=s390x go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-linux-s390x.tar.gz" ${APP_NAME} 
	#android
	CGO_ENABLED=0 GOOS=android GOARCH=386 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-android-386.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=android GOARCH=amd64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-android-amd64.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=android GOARCH=arm go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-android-arm.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=android GOARCH=arm64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-android-arm64.tar.gz" ${APP_NAME} 
	#darwin
	CGO_ENABLED=0 GOOS=darwin GOARCH=386 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-darwin-386.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-darwin-amd64.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-darwin-arm.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-darwin-arm64.tar.gz" ${APP_NAME} 
	#dragonfly
	CGO_ENABLED=0 GOOS=dragonfly GOARCH=amd64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-dragonfly-amd64.tar.gz" ${APP_NAME} 
	#freebsd
	CGO_ENABLED=0 GOOS=freebsd GOARCH=386 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-freebsd-386.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=freebsd GOARCH=amd64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-freebsd-amd64.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=freebsd GOARCH=arm go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-freebsd-arm.tar.gz" ${APP_NAME} 
	#nacl
	CGO_ENABLED=0 GOOS=nacl GOARCH=386 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-nacl-386.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=nacl GOARCH=amd64p32 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-nacl-amd64p32.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=nacl GOARCH=arm go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-nacl-arm.tar.gz" ${APP_NAME} 
	#netbsd
	CGO_ENABLED=0 GOOS=netbsd GOARCH=386 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-netbsd-386.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=netbsd GOARCH=amd64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-netbsd-amd64.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=netbsd GOARCH=arm go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-netbsd-arm.tar.gz" ${APP_NAME} 
	#openbsd
	CGO_ENABLED=0 GOOS=openbsd GOARCH=386 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-openbsd-386.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=openbsd GOARCH=amd64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-openbsd-amd64.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=openbsd GOARCH=arm go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-openbsd-arm.tar.gz" ${APP_NAME} 
	#plan9
	CGO_ENABLED=0 GOOS=plan9 GOARCH=386 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-plan9-386.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=plan9 GOARCH=amd64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-plan9-amd64.tar.gz" ${APP_NAME} 
	CGO_ENABLED=0 GOOS=plan9 GOARCH=arm go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-plan9-arm.tar.gz" ${APP_NAME} 
	#solaris
	CGO_ENABLED=0 GOOS=solaris GOARCH=amd64 go build -o ${APP_NAME} -ldflags ${LDFLAGS} && tar zcfv "${RELEASE}/${APP_NAME}-solaris-amd64.tar.gz" ${APP_NAME} 
	#windows
	CGO_ENABLED=0 GOOS=windows GOARCH=386 go build -o ${APP_NAME}-noconsole.exe
	CGO_ENABLED=0 GOOS=windows GOARCH=386 go build -o ${APP_NAME}.exe && tar zcfv "${RELEASE}/${APP_NAME}-windows-386.tar.gz" ${APP_NAME}.exe ${APP_NAME}-noconsole.exe
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o ${APP_NAME}-noconsole.exe
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o ${APP_NAME}.exe && tar zcfv "${RELEASE}/${APP_NAME}-windows-amd64.tar.gz" ${APP_NAME}.exe ${APP_NAME}-noconsole.exe

	rm -rf ${APP_NAME} ${APP_NAME}.exe ${APP_NAME}-noconsole.exe