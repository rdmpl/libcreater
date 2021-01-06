help:
	@echo "---------------------------------------------------------------"
	@echo USAGES:
	@echo "     make clean:   to clean the generated files"
	@echo "     make ali:     to build all ali libraries"
	@echo "     make hisi:    to build hisi libraries"
	@echo "     make compress:to compress libs and headers to the gz files"
	@echo "     make 3281:    to build libs for ali3281"
	@echo "     make 3020C:   to build libs for ali3202C"
	@echo "     make 3529:    to build libs for ali3529"
	@echo "     make 3711C:   to build libs for ali3711C"
	@echo "     make 3716:    to build libs for hisi3716"
	@echo "NOTE:"
	@echo "     When you switch platform, please execute 'make clean' first"
	@echo "If you want to upload the libs to svn, do as following steps:"
	@echo "     1.make clean (on linux/windows)"
	@echo "     2.make hisi (on linux)"
	@echo "     3.make ali (on windows)"
	@echo "     4.make compress (on linux/windows)"
	@echo "     5.modify the README.txt and add your changelogs at the "
	@echo "       beginning of CHANGELOG together with your lib version"
	@echo "     6.upload the whole project to svn"
	@echo "---------------------------------------------------------------"
3281:
	@make -C ./source plat=3281
3202C:
	@make -C ./source plat=3202C
3529:
	@make -C ./source plat=3529
3711C:
	@make -C ./source plat=3711C
3716:
	@make -C ./source plat=3716
ali:
	@make -C ./source plat=3281 rebuild
	@make -C ./source plat=3711C rebuild
	@make -C ./source plat=3529 rebuild
	@make -C ./source plat=3202C rebuild
	@echo "All finished!"
hisi:
	@make -C ./source plat=3716 rebuild
	@echo "All finished!"
compress:
	@tar -acf build/liball.tar.gz include build/lib
	@echo "All finished!"
clean:
	@make -C ./source clean
	@rm -rf build
	@echo "All finished!"
