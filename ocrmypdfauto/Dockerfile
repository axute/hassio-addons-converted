FROM cmccambridge/ocrmypdf-auto:latest

# Add wrapper script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Add stored original entrypoint/cmd
COPY original_entrypoint /run/original_entrypoint
COPY original_cmd /run/original_cmd

ENTRYPOINT ["/run.sh"]
CMD []
