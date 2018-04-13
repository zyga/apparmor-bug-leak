.PHONY: stress
stress: neutered-sample.bin
	sudo sh -c 'for i in `seq 10000`; do  dd if=$^ of=/sys/kernel/security/apparmor/.replace bs=1M status=none; done'

%.flat.aa: %.aa
	apparmor_parser --skip-kernel-load --preprocess $^ > $@

%.bin: %.aa
	apparmor_parser --skip-kernel-load $^ -o $@
