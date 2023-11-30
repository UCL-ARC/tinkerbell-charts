#!/usr/bin/env bash

set -o nounset
set -euxo pipefail

rm -f *.tar.gz checksum.txt vmlinuz* initramfs*
base_loc="https://github.com/tinkerbell/hook/releases/download/${HOOK_VERSION}"
files="${base_loc}/hook_aarch64.tar.gz ${base_loc}/hook_x86_64.tar.gz ${base_loc}/checksum.txt"
tmp_dir=$(mktemp -d)

for f in ${files}; do
  echo "${f}"
  wget -P "${tmp_dir}" "${f}"
done

(cd "${tmp_dir}" && sha512sum -c checksum.txt)
mv "${tmp_dir}"/checksum.txt .

for f in ${tmp_dir}/*.tar.gz; do 
    tar --no-same-permissions -ozxvf "${f}" && rm -f "${f}";
done
rm -rf "${tmp_dir}"
