FROM dianaestrada/cobol-maven-jenkinsagent:1.0 as builder
COPY src/main/cobol/CALCULATOR2.CBL .
RUN cobc -x -free -o calculator2-exe CALCULATOR2.CBL &&\
    cp calculator2-exe /tmp

FROM centos
ADD http://packages.psychotic.ninja/7/base/x86_64/RPMS/libcob-1.1-5.el7.psychotic.x86_64.rpm /tmp/libcob-1.1-5.el7.psychotic.x86_64.rpm
RUN yum -y install gcc gcc-c++ gmp-devel libdb-devel libicu glibc-devel &&\
    yum -y install /tmp/libcob-1.1-5.el7.psychotic.x86_64.rpm
COPY --from=builder /tmp/calculator2-exe /usr/bin/
ENTRYPOINT ["calculator2-exe"]
CMD ["0", "0", "a"]
