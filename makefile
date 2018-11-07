.PHONY = install uninstall

NAME = goLang-http-server
INSTALL_LOCATION = /opt/${NAME}
SERVICE_SCRIPT = /etc/systemd/system/${NAME}.service

install:
	@cp ${NAME}.service ${SERVICE_SCRIPT}
	@mkdir -p ${INSTALL_LOCATION}
	@cp goWebServer ${INSTALL_LOCATION}
	@cp -r static ${INSTALL_LOCATION}
	@systemctl daemon-reload

systemd_uninstall:
	@rm -rf ${INSTALL_LOCATION}
	@rm -rf ${SERVICE_SCRIPT}
