USE_FREENIT = YES
REGGAE_PATH = /usr/local/share/reggae
SERVICES = backend https://github.com/cbsdng/backend \
	   frontend https://github.com/cbsdng/frontend

.include <${REGGAE_PATH}/mk/project.mk>
