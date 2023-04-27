<script>
import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    userToken: JSON.parse(localStorage.getItem('userToken'))
  }),
  actions: {
    setUserToken (userToken) {
      // this.userToken = userToken

      localStorage.setItem('userToken', JSON.stringify(userToken))
    },
    getUserToken () {
      return this.userToken
    },
    removeUserToken (userToken) {
      localStorage.removeItem('userToken')
    }
  }
})
</script>

<!-- <script>
import { defineStore } from 'pinia'

export const useAuthStore = defineStore('auth', {
  state: () => ({
    token: null
  }),
  actions: {
    setToken (token) {
      this.token = token
    },
    getToken () {
      return this.token
    }
  }
})
</script> -->

<!-- import { defineStore } from 'pinia'

export const useAuthStore = defineStore({
  id: 'auth',
  state: () => ({
    token: null,
  }),
  getters: {
    getToken: (state) => state.token,
  },
  actions: {
    setToken(token) {
      this.token = token
    },
  },
}) -->
