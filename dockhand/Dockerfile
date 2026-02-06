FROM fnsys/dockhand:v1.0.14
COPY --from=hairyhenderson/gomplate:latest /gomplate /bin/gomplate

# Add wrapper script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Add stored original entrypoint/cmd
COPY original_entrypoint /run/original_entrypoint
COPY original_cmd /run/original_cmd
# Add startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/run.sh"]
CMD []
