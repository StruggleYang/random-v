<template>
  <div id="app">
    <div v-if="mobile">
      <button @click="getR">测试一哈</button>
    </div>
    <div v-else style="margin-top: 60px;">请使用手机浏览器打开此页面！！！</div>
  </div>
</template>

<script>
export default {
  name: "app",
  data() {
    return {
      mobile: false
    };
  },
  mounted: function() {
    this.mobile = this.isMobile();
    localStorage.setItem("name", "struy");
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
    getR: function() {
      console.log("d");
      var s = localStorage.getItem("name");
      console.log(s);
      alert(s);
    }
  }
};
</script>

<style>
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
</style>
