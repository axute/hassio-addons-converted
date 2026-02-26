FROM traefik:v3.6.9
# gomplate for destruct variables
COPY --from=hairyhenderson/gomplate:stable /gomplate /bin/gomplate
# Add wrapper script
COPY run.sh /run.sh
RUN chmod +x /run.sh
COPY original_entrypoint /run/original_entrypoint
COPY original_cmd /run/original_cmd
ENTRYPOINT ["/run.sh"]
CMD []
