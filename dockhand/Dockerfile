FROM fnsys/dockhand:v1.0.14
RUN (apt-get update && apt-get install -y jq || apk add --no-cache jq || yum install -y jq || true)
COPY ha_entrypoint.sh /ha_entrypoint.sh
RUN chmod +x /ha_entrypoint.sh
ENTRYPOINT ["/ha_entrypoint.sh"]
CMD []
