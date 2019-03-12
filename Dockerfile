FROM centos:7

# rubyとrailsのバージョンを指定
ENV ruby_ver="2.5.3"
ENV rails_ver="5.2.2"

# 必要なパッケージをインストール
RUN yum -y update && \
  yum -y install epel-release && \
  yum -y install net-tools && \
  yum -y install nodejs --enablerepo=epel && \
  yum -y install git make autoconf curl wget && \
  yum -y install gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel sqlite-devel bzip2 && \
  yum clean all

# rubyとbundleをダウンロード
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv && \
  git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build

# コマンドでrbenvが使えるように設定
RUN echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile.d/rbenv.sh && \
  echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile.d/rbenv.sh && \
  echo 'eval "$(rbenv init --no-rehash -)"' >> /etc/profile.d/rbenv.sh

# rubyとrailsをインストール
RUN source /etc/profile.d/rbenv.sh; rbenv install ${ruby_ver}; rbenv global ${ruby_ver} && \
  source /etc/profile.d/rbenv.sh; gem update --system; gem install --version ${rails_ver} --no-ri --no-rdoc rails; gem install bundle

# Set workspace
RUN mkdir /app
WORKDIR /app

EXPOSE  3000
