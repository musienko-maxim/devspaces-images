# Copyright (c) 2019-2021 Red Hat, Inc.
# This program and the accompanying materials are made
# available under the terms of the Eclipse Public License 2.0
# which is available at https://www.eclipse.org/legal/epl-2.0/
#
# SPDX-License-Identifier: EPL-2.0
#
# Contributors:
#   Red Hat, Inc. - initial API and implementation
#

# https://access.redhat.com/containers/?tab=tags#/registry.access.redhat.com/ubi8/go-toolset
FROM registry.access.redhat.com/ubi8/go-toolset:1.16.12-7 as builder
ENV GOPATH=/go/
ENV RESTIC_TAG=v0.12.0
ARG DEV_WORKSPACE_CONTROLLER_VERSION="v0.11.0"
ARG DEV_HEADER_REWRITE_TRAEFIK_PLUGIN="v0.1.2"
ARG TESTS="true"
USER root

RUN mkdir -p $GOPATH/restic && \
    curl -sSLo- https://api.github.com/repos/restic/restic/tarball/${RESTIC_TAG} | tar --strip-components=1 -xz -C $GOPATH/restic && \
    cd $GOPATH/restic && go mod vendor

