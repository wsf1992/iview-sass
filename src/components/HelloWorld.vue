<template>
  <div class="box">
    <p>h1下的p1</p>
  </div>
</template>

<script>
export default {
  data() {
    return {}
  },
  methods: {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped="" lang="scss" type="text/css">
.box p {
  font-size: 20px;
  border : {
    width: 20px;
    color: red;
    style: solid;
  }
}
</style>
