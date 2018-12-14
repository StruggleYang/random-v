<script>
import axios from 'axios'
export default {
    get (url, res) {
        axios.get(url)
            .then(res)
            .catch(err => {
                console.log(err);
            })
    },
    post (url, data, res) {
        axios.post(url, data)
            .then(res)
            .catch(err => {
                console.log(err);
            })
    }
}
</script>
