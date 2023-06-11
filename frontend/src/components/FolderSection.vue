<template>
  <div class="flex-auto pt-5">
    <div class="flex-auto shadow-md rounded-2xl">
      <div
        class="bg-gradient-to-br relative h-12 from-sky-200 to-indigo-200 rounded-t-2xl"
      >
        <div class="absolute top-[5px] right-[7px] py-[-12px]">
          <slot name="EditButton" />
        </div>

        <div
          class="w-60 h-[69px] top-[-4px] px-7 absolute bg-[url('src/assets/tab.svg')] bg-no-repeat flex flex-row justify-start items-center rounded-t-2xl"
        >
          <div class="mb-1 ml-1">
            <slot name="title" />
          </div>
        </div>
      </div>
      <div class="flex-auto px-5 pt-7 pb-10 rounded-b-2xl bg-white">
        <slot />
      </div>
    </div>
  </div>
</template>
