#We need sql/gen_lex_hash, scripts/comp_sql and extra/comp_err for the
#host system and not for the target. For that you have to compile mysql
#also for the host system and copy the needed binary files to fond
#in PATH
#Info at: http://bugs.mysql.com/bug.php?id=61340
PATH=$PATH:${PKG_DATA}

echo PKG_ROOT = ${PKG_ROOT}
echo PKG_WORK = ${PKG_WORK}
echo PKG_DATA = ${PKG_DATA}
echo PKG_DEST = ${PKG_DEST}

pkg:setup
#pkg:autoconf
autoconf-2.69

LD="${PKG_TARG}"-ld CC="${PKG_TARG}"-gcc CXX="${PKG_TARG}"-gcc pkg:configure ac_cv_path_HOSTNAME=/usr/bin/hostname ac_cv_path_PERL=no ac_cv_prog_OBJDUMP=no ac_cv_c_stack_direction=-1 ac_cv_sys_restartable_syscalls=yes mysql_cv_gcc_atomic_builtins=no --with-mysqld-user=daemon --with-mysqld-ldflags=-all-static --with-unix-socket-path=/tmp/mysql.sock --with-low-memory --disable-largefile --without-geometry --without-query-cache --without-man --without-bench --without-docs --sysconfdir=/etc --localstatedir=/usr/local/var --prefix=/usr/local --without-debug --with-innodb

#copy needed and compiled executable files from the host system (Ubuntu 8.04.4 LTS Hardy Heron)
cp ${PKG_DATA}/comp_err extra/
cp ${PKG_DATA}/comp_sql scripts/
cp ${PKG_DATA}/gen_lex_hash sql/

#Set the time stamps to the future, to prevent 'make' to recompile the files...
touch -t "203012120101" extra/comp_err
touch -t "203012120101" scripts/comp_sql
touch -t "203012120101" sql/gen_lex_hash


pkg:make
make install DESTDIR="${PKG_DEST}" "$@" 

#delete not needed files for the .deb package
rm -r "${PKG_DEST}"/usr/local/mysql-test
rm -r "${PKG_DEST}"/usr/local/sql-bench
rm -r "${PKG_DEST}"/usr/local/include
rm -r "${PKG_DEST}"/usr/local/lib/mysql/*.a

#add files to the packages
mkdir -p "${PKG_DEST}"/etc
cp ${PKG_DATA}/com.atv.mysql.my.cnf ${PKG_DEST}/etc
