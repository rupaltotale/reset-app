/**
 * v0 by Vercel.
 * @see https://v0.dev/t/NaBVabJ4D5o
 * Documentation: https://v0.dev/docs#integrating-generated-code-into-your-nextjs-app
 */
import Image from "next/image";
import Link from "next/link";
import ImageSlideDeck from "./ImageSlideDeck";

export default function Component() {
  return (
    <div className="flex flex-col min-h-[100dvh]">
      <main className="flex-1">
        <section className="w-full pt-12 md:py-24 lg:py-32 border-y">
          <div className="px-4 md:px-6 space-y-10 xl:space-y-16">
            <div className="grid max-w-[1300px] mx-auto gap-4 px-4 sm:px-6 md:px-10 md:grid-cols-2 md:gap-16">
              <div>
                <h1 className="lg:leading-tighter text-3xl font-bold tracking-tighter sm:text-4xl md:text-5xl xl:text-[3.4rem] 2xl:text-[3.75rem]">
                  Start each day new with Reset
                </h1>
                <p className="mx-auto max-w-[700px] text-gray-500 md:text-xl dark:text-gray-400">
                  Track your bedtime habits, start each day with a wise outlook,
                  and keep a pulse on how you are doing.
                </p>
                <div className="space-x-4 mt-6">
                  <DownloadButton />
                </div>
              </div>
              <div className="flex items-center justify-center p-4">
                <ImageSlideDeck />
              </div>
            </div>
          </div>
        </section>
      </main>
    </div>
  );
}
function DownloadButton() {
  return (
    <Link
      href="https://apps.apple.com/us/app/pocket-chef-recipes/id6504206438"
      prefetch={false}
    >
      <Image
        src="/app-store.png"
        alt="App Store Logo"
        width={250}
        height={100}
        className="mr-2"
      />
    </Link>
  );
}

function CookingPotIcon(props: any) {
  return (
    <svg
      {...props}
      xmlns="http://www.w3.org/2000/svg"
      width="24"
      height="24"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <path d="M2 12h20" />
      <path d="M20 12v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-8" />
      <path d="m4 8 16-4" />
      <path d="m8.86 6.78-.45-1.81a2 2 0 0 1 1.45-2.43l1.94-.48a2 2 0 0 1 2.43 1.46l.45 1.8" />
    </svg>
  );
}
