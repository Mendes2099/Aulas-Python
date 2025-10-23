# My Portfolio

Welcome to my portfolio project! This is / will be my website that I've built to showcase my skills and the projects I've worked on too.

## Getting Started

If you want to run this project on your own computer, you'll need [Node.js](https://nodejs.org/) installed. Then, follow these steps.

1.  **Clone the repository** (or download the source code):
    ```sh
    git clone <your-repository-url>
    ```

2.  **Navigate to the project directory**:
    ```sh
    cd Portfolio
    ```

3.  **Install NPM packages**: This command reads the `package.json` file and downloads all the necessary tools and libraries (like the ones described below) into the `node_modules` folder.
    ```sh
    npm install
    ```

4.  **Run the development server**: This will start a local web server so you can see the website in your browser. The site will often automatically reload when you make changes to the code.
    ```sh
    npm run dev
    ```
    Once it's running, you can open your web browser and go to `http://localhost:(your port number)`.

## How This Website is Built

This website uses several modern tools and libraries. I opted by going with React because it allows me to use cool UI tools such as shadCN and Vercel that let me add libraries for styling, animation, and other features.

### The Foundation: React

*   **What is it?** - React is a popular JavaScript library for building user interfaces. Its main idea is to break down the UI into small, reusable pieces called **components**.

*   **How did I use it?** - This entire website is a collection of React components. For example, there's a `Header` component, a `ProjectCard` component, and a `Footer` component. They themselfs are built by other smaller componests such as `buttons` and if I so wished, I could now use and reuse these components anywhere on my website. This makes the code organized, easy to manage, and efficient. Each component is responsible for handeling just enough for what it need to do. The website you're looking at is therfore just a set of components working together to form the main app!

### The Structure: Components and UI

This project uses a modern approach to building the user interface, relying on a combination of a utility-first CSS framework and a component library philosophy.

*   **Tailwind CSS**: Instead of writing traditional CSS files, this project uses Tailwind. It's a "utility-first" CSS framework, which means we can style elements directly in the code using pre-made classes like `bg-blue-500` (for a blue background) or `text-lg` (for large text). This makes styling faster and more consistent.

*   **shadcn/ui**: This project uses components from the **shadcn/ui** library. What's unique about shadcn/ui is that it's not a typical component library you install. Instead, you copy its designs and accessible components (like buttons, dialogs, and cards) directly into your project. This gives you full control over the code and allows you to easily use and edit fully responsive components and use ones built by the comunity too.

### Bringing it to Life: Animations and Effects

A static page can be boring. These libraries add motion and interactivity:

*   **Framer Motion**: This is an animation library for React. It's used to create the smooth transitions, fades, and other dynamic effects you see when you interact with the website.

*   **React Intersection Observer**: This is a helper that detects when an element enters the screen. It's often used to trigger animations (with Framer Motion) as you scroll down the page.

*   **React Type Animation**: This library creates the "typing" effect for text, which is great for grabbing attention on a landing page.

*   **tsParticles**: This is used to create the cool, animated particle background, adding a touch of visual flair to the site.

### The "Behind the Scenes" Tools

These are the essential tools that make the development process smooth and fast, but you don't see them directly in the browser.

*   **npm**: This is the package manager that runs our development tools and manages dependencies. Through npm, we can start a local development server that updates instantly when we change the code. When we’re ready to deploy, npm runs build tools that bundle everything into small, optimized files for the best performance.

*   **TypeScript**: This project is written in TypeScript. It's a version of JavaScript that adds "types," allowing us to be more explicit about our data. This helps catch bugs early and makes the code easier to understand and maintain.

*   **React Router DOM**: In a multi-page website, you need a way to handle navigation. Altought I dont use this feature much in my website this library lets you create different "pages" (like `/about` or `/projects`) and links between them without having to reload the entire site each time.

I hope this documentation helps you and others understand your project better. It's a great starting point, and you can add more details about your portfolio's specific features and design choices.

Happy coding!