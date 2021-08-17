clean:
	rm -Rf bftpd
	rm -Rf brotli
	rm -Rf curl-7.64.1
	rm -Rf thttpd-2.27
	rm -Rf vsftpd-3.0.3
	rm -Rf brotli_mod
	rm -Rf apr-1.7.0
	rm -Rf apr-util-1.6.1
	rm -Rf Apache
	rm -Rf pcre-8.42
	rm -Rf httpd-2.4.39
	rm -Rf 
	rm -f *.log
	rm -Rf clam-prov

realclean:
	make clean
	rm -f bitcode_llvm11/*.bc
	rm -Rf clam-prov-install
