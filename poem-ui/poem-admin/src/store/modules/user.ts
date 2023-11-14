import { defineStore } from 'pinia';

import { getUserInfo, login, logout } from '@/api/auth';
import { ResultEnum } from '@/enums/httpEnum';
import { usePermissionStore } from '@/store';
import type { UserInfo } from '@/types/interface';
import { useRoute, useRouter } from 'vue-router';
import { useI18nStore } from '@/store/modules/i18n'

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
    language: (state) => {
      return state.userInfo?.language;
    },
  },
  actions: {
    async setLanguage(lang: string) {
      this.userInfo.language = lang
    },
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
      if (ResultEnum.SUCCESS === code) {
        console.log('info', result)
        this.userInfo = result;
        if (result.language) {
          useI18nStore().changeLanguage(result.language)
        }
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
