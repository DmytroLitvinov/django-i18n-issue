# python3.11 and python3.12 have issue issues
#FROM python:3.12.3-bookworm as base
FROM python:3.11.9-bookworm as base
# in Python3.10 there is no issue
#FROM python:3.10.14-bookworm as base

# Environment Varialables
ENV PYTHONBREAKPOINT=ipdb.set_trace \
    # python:
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PYTHONDONTWRITEBYTECODE=1 \
	# other:
	DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

RUN set -ex; \
	if ! command -v gpg > /dev/null; then \
		apt-get update; \
		apt-get install -y --no-install-recommends \
			gnupg \
			dirmngr \
		; \
		rm -rf /var/lib/apt/lists/*; \
	fi

RUN set -xe; \
	apt-get update && apt-get upgrade -y \
	&& apt-get install --no-install-recommends -y \
      curl \
      gettext


WORKDIR /app

COPY compose/entrypoint.sh /docker-entrypoint.sh

# Setting up proper permissions:
RUN chmod +x '/docker-entrypoint.sh'

# We customize how our app is loaded with the custom entrypoint:
CMD ["/docker-entrypoint.sh"]


###############################################################################
FROM base as local

COPY requirements /requirements
RUN pip install --pre -r /requirements/base.txt && rm -rf /requirements;