import { defineStore } from 'pinia';

import { getUserInfo, login, logout } from '@/api/auth';
import { ResultEnum } from '@/enums/httpEnum';
import { usePermissionStore } from '@/store';
import type { UserInfo } from '@/types/interface';
import { useRoute, useRouter } from 'vue-router';

const InitUserInfo: UserInfo = {
  userName: '',
  token: '',
  roleIds: [],
  roleCodes: [],
  permissions: [],
  userId: '',
  language: ''
};

export const useUserStore = defineStore('user', {
  state: () => ({
    token: 'main_token', // 默认token不走权限
    userInfo: { ...InitUserInfo },
  }),
  getters: {
    roles: (state) => {
      return state.userInfo?.roleIds;
    },
  },
  actions: {
    async login(userInfo: Record<string, unknown>) {
      const { code, message, result } = await login(userInfo);
      if (code === ResultEnum.SUCCESS) {
        this.token = result;
      } else {
        throw message;
      }
    },
    async getUserInfo() {
      const { result, code } = await getUserInfo();
      // const res = await mockRemoteUserInfo(this.token);
      if (ResultEnum.SUCCESS === code) {
        console.log('info', result)
        this.userInfo = result;
      }
    },
    async logout() {
      this.token = '';
      this.userInfo = { ...InitUserInfo };
    },
  },
  persist: {
    afterRestore: () => {
      const permissionStore = usePermissionStore();
      permissionStore.initRoutes();
    },
    key: 'user',
    paths: ['token'],
  },
});
