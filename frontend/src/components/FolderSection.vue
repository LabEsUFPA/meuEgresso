<template>
  <div class="pt-5">
    <div class="shadow-md rounded-xl">
      <div class="bg-gradient-to-br relative h-9 from-sky-200 to-indigo-200 rounded-t-xl">
        <div class="w-60 h-12 top-[-8px] px-6 py-1 absolute bg-[url('src/assets/tab.svg')] bg-no-repeat flex flex-row justify-start items-center">
          <slot name="title" />
        </div>
      </div>
      <div class="px-5 pt-7 pb-10 rounded-b-xl bg-white">
        <slot />
      </div>
    </div>
  </div>
</template>
