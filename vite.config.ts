import { fileURLToPath, URL } from 'url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import vueJsx from '@vitejs/plugin-vue-jsx'

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [vue(), vueJsx()],
    resolve: {
        alias: {
            '@': fileURLToPath(new URL('./src', import.meta.url))
        }
    },
    build: {
        target: 'modules',
        outDir: 'dist', // 指定输出路径
        assetsDir: './assets', // 指定生成静态资源的存放路径
        minify: 'terser', // 混淆器,terser构建后文件体积更小
        sourcemap: false,
        terserOptions: {
            compress: {
                drop_console: true, // 生产环境移除console
                drop_debugger: true // 生产环境移除debugger
            }
        },
        // rollupOptions: {
        //     treeshake: false,
        //     output: {
        //         manualChunks(id) {
        //             if (id.includes('node_modules')) {
        //                 return id.toString().split('node_modules/')[1].split('/')[0].toString()
        //             }
        //         }
        //     }
        // }
    },
    server: {
        // open: true, // 是否在浏览器打开
        // port: 8088, // 端口号
        // host: 'local.xxx.com'
    },
    // 引入第三方配置
    optimizeDeps: {
        include: []
    }
})
