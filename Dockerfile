FROM djsell/mono:latest

ENV HOME /root

RUN apt-get install -y unzip

RUN curl https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh | sh

# FIXME kvm upgrade is returning exit code 1 but appears to run fine
RUN /bin/bash -c "source ~/.kre/kvm/kvm.sh && kvm upgrade || true"

ADD scripts/entrypoint.sh /opt/kvm/entrypoint.sh
ENTRYPOINT ["/opt/kvm/entrypoint.sh"]
