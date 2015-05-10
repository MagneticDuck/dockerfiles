FROM tutum/lamp
WORKDIR /
RUN rm -rf /app && git clone https://github.com/MagneticDuck/magnetic.uk.to /app
EXPOSE 80 3306
CMD ["/run.sh"]
