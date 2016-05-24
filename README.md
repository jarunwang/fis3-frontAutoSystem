var query = '?=@varsion';

fis.match('::packager', {
   		spriter: fis.plugin('csssprites')
	 })
	
	
fis.media('online')
    .match('**.js', {
   		optimizer: fis.plugin('uglify-js')
 	})
    .match('**.css', {
   		useSprite: true,
   		optimizer: fis.plugin('clean-css')
 	})
 	.match('**.png', {
	   optimizer: fis.plugin('png-compressor')
	})
 	.match('::package', {postpackager: fis.plugin('html-replace', {
	    replace: true // 默认false, true 替换为替换内容, false 替换为原始内容 
	}, 'append')})
 	.match('*.{js,css,png}', {//文件名加入MD5
  		useHash: false
	})
 	.match('::package', {
	  postpackager : fis.plugin('query', {
	    placeholder: query, // 这里传入占位符 
	    // 不使用replace参数时，默认输出每个文件对应的md5作为query部分 
	    // ret：打包信息，subpath：处理的资源路径，file：subpath对应的文件对象 
	    replace: function (ret, subpath, file) {
	      return Date.now();
	    }
	  })
	})
	/*.match('*', {
	    query: query
	})
	.match('::package', {
	  postpackager : fis.plugin('query', {
	    placeholder: query // 这里传入占位符 
	  })
	});*/
  
fis.media('dev').match('::package', {postpackager: fis.plugin('html-replace', {
	    replace: false // 默认false, true 替换为替换内容, false 替换为原始内容 
	}, 'append')})	
   

fis.media('upload').match('*', {
    deploy: fis.plugin('ftp', {
        //console: true,
        cache : true,           // 是否开启上传列表缓存，开启后支持跳过未修改文件，默认：true
        remoteDir : '/temp/',   // 远程文件目录，注意！！！设置错误将导致文件被覆盖
        connect : {
            host : '127.0.0.1',
            port : '21',
            user : 'name',
            password : '****'
        }
    })
});

		
/*fis.match('*.js', {//提供本地部署
    deploy: fis.plugin('local-supply', {
        to: './output',
        exclude : ['template']
    })
})*/

fis.media('debug').match('*.{js,css,png}', {
  useHash: false,
  useSprite: false,
  optimizer: null
})

