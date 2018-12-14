<template>
  <div id="app">
    <div class="main" v-if="mobile">
      <div
        class="big-img"
        style="background-position: center;background-size: cover;"
        :style="{backgroundImage:'url(./static/img/'+currBg+')'}"
      ></div>
      <div class="but-box">
        <a class="circle-button" @click="execRedom">抽取({{currNumber}})</a>
      </div>
    </div>
    <div v-else style="margin-top: 60px;">请使用手机浏览器打开此页面！！！</div>
  </div>
</template>

<script>
import ajax from "./Ajax";
var RANDOM_DATA_KEY = "randomData"; // 缓存所有数据
var USED_DATA_KEY = "usedNumbers"; // 已经使用的数字缓存
var NUMBERS_KEY = "numbers";
export default {
  name: "app",
  data() {
    return {
      mobile: false,
      currBg: "0.jpg",
      currNumber: 0
    };
  },
  mounted: function() {
    this.reset();
  },
  methods: {
    isMobile: function() {
      var sUserAgent = navigator.userAgent.toLowerCase();
      var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
      var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
      var bIsMidp = sUserAgent.match(/midp/i) == "midp";
      var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
      var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
      var bIsAndroid = sUserAgent.match(/android/i) == "android";
      var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
      var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
      if (
        bIsIpad ||
        bIsIphoneOs ||
        bIsMidp ||
        bIsUc7 ||
        bIsUc ||
        bIsAndroid ||
        bIsCE ||
        bIsWM
      ) {
        return true;
      } else {
        return false;
      }
    },
    execRedom: function() {
      var allData = localStorage.getItem(RANDOM_DATA_KEY); //元数据
      var useEnd = localStorage.getItem(USED_DATA_KEY); // 已使用的数字，重置按钮就可以已重置了
      if (allData !== null) {
        /**
         * 抽取池排除已使用的数
         * 将抽到的数存储到已使用的数据内
         */
        var numbers = new Array();
        numbers = JSON.parse(localStorage.getItem(NUMBERS_KEY));
        if (numbers.length > 0) {
          var semen = this.redom(0, numbers.length);
          // 最终结果
          var random_v = numbers[semen];
          // 将已抽取的移除重新存储
          numbers.splice(semen, 1);
          localStorage.setItem(NUMBERS_KEY, JSON.stringify(numbers));

          if (useEnd !== null) {
            //存在已抽取的，加入，存储
            var uses = new Array();
            uses = JSON.parse(useEnd);
            uses.push(random_v);
            localStorage.setItem(USED_DATA_KEY, JSON.stringify(uses));
          } else {
            // 没有已抽取的就新建
            var uses1 = new Array();
            uses1.push(random_v);
            localStorage.setItem(USED_DATA_KEY, JSON.stringify(uses1));
          }

          this.currNumber = random_v;
        } else {
          var reset = confirm(
            "像我这么优秀的人,没有东西可以抽了，确认重置吗！"
          );
          if (reset) {
            // 重置
            localStorage.setItem(USED_DATA_KEY, JSON.stringify(new Array()));
            localStorage.removeItem(NUMBERS_KEY);
            localStorage.removeItem(RANDOM_DATA_KEY);
            this.reset();
          } else {
            alert("你什么都不做，我很慌");
          }
        }
      } else {
        alert("像我这么优秀的人,再试一次");
        ajax.get("./static/data/number.json", res => {
          // 初始化描述数据
          localStorage.setItem(RANDOM_DATA_KEY, JSON.stringify(res.data));
        });
      }
    },
    redom: function(m, n) {
      return Math.floor(Math.random() * (m - n) + n);
    },
    reset: function() {
      this.mobile = this.isMobile();
      if (localStorage.getItem(RANDOM_DATA_KEY) === null) {
        ajax.get("./static/data/number.json", res => {
          // 初始化描述数据
          localStorage.setItem(RANDOM_DATA_KEY, JSON.stringify(res.data));
        });
      }
      // 存种子数据
      if (localStorage.getItem(NUMBERS_KEY) === null) {
        var arr = new Array();
        for (var i = 1; i <= 100; i++) {
          arr.push(i);
        }
        localStorage.setItem(NUMBERS_KEY, JSON.stringify(arr));
      }
    }
  }
};
</script>

<style>
html,
body,
#app,
.main {
  margin: 0;
  padding: 0;
  overflow: hidden;
  position: relative;
  bottom: 0;
  height: 100%;
  top: 0;
}
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

h1,
h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
.big-img {
  height: 65%;
}
.but-box {
  height: 35%;
  background-color: #efefef;
  display: flex;
  display: -webkit-flex; /* Safari */
  justify-content: center;
  align-items: center;
}
.circle-button {
  display: block;
  background-color: #69a8ff;
  width: 150px;
  height: 150px;
  border-radius: 150px;
  font-size: 32px;
  color: #efefef;
  text-align: center;
  line-height: 150px;
}
</style>
