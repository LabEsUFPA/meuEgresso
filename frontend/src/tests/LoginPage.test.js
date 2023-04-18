import { mount } from "@vue/test-utils";
import { describe, expect, it } from "vitest";
import LoginPage from "../pages/PaginaLogin.vue";

describe("LoadingPage", () => {
  it("renders properly", () => {
    const wrapper = mount(LoginPage);
    expect(wrapper.vm).toBeDefined();
  });

  it("renders properly", () => {
    const wrapper = mount(LoginPage);
    console.log(wrapper.vm.CustomInput);
  });
});
