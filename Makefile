USE_FREENIT = YES
REGGAE_PATH = /usr/local/share/reggae
SERVICES = redis https://github.com/mekanix/jail-redis \
	   terminal https://github.com/cbsdng/terminal \
	   backend https://github.com/cbsdng/backend \
	   frontend https://github.com/cbsdng/frontend

post_setup:
.if !exists(/var/run/cbsdng)
	@sudo mkdir /var/run/cbsdng
.endif
.for service url in ${SERVICES}
	@echo "/var/run/cbsdng /var/run/cbsdng nullfs rw 0 0" >services/${service}/templates/fstab
.endfor
.if !exists(${HOME}/.ccache)
.if exists(/usr/local/bin/ccache)
	@ccache -c
.else
	@mkdir ${HOME}/.ccache
.endif
.endif
	@echo "${HOME}/.ccache /usr/home/devel/.ccache nullfs rw 0 0" >>services/terminal/templates/fstab

.include <${REGGAE_PATH}/mk/project.mk>
