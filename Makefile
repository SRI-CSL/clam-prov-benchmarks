clean:
	rm -Rf bftpd
	rm -Rf brotli
	rm -Rf curl-7.64.1
	rm -Rf thttpd-2.27
	rm -Rf vsftpd-3.0.3
	rm -Rf brotli_mod
	rm -f *.log
	rm -Rf clam-prov

realclean:
	make clean
	rm -f bitcode_llvm11/*.bc
	rm -Rf clam-prov-install
