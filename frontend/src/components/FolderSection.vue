<template>
  <div class="shadow-md rounded-xl pt-5">
    <div class="bg-gradient-to-br rounded-t-xl relative h-9 from-sky-200 to-indigo-200">
      <div class="w-60 h-12 top-[-8px] px-6 py-1 absolute bg-[url('src/assets/tab.svg')] bg-no-repeat flex flex-row justify-start items-center">
        <slot name="title" />
      </div>
    </div>
    <div class="px-5 pt-7 pb-10 bg-white">
      <slot />
    </div>
  </div>
</template>
