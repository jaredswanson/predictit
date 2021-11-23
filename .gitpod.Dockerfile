FROM gitpod/workspace-full
USER gitpod

# Install custom tools, runtime, etc.
# COPY --chown=gitpod:gitpod .ruby-version /tmp
RUN echo "rvm_gems_path=/home/gitpod/.rvm" > ~/.rvmrc
#RUN bash -lc "rvm reinstall ruby-$(cat /tmp/.ruby-version) \
#              && rvm use ruby-$(cat /tmp/.ruby-version) --default \
#              && gem install rubocop rubocop-performance"
RUN bash -lc "rvm reinstall ruby-3.0.2 \
              && rvm use ruby-3.0.2 --default \
              && gem install rubocop rubocop-performance"
RUN echo "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc
