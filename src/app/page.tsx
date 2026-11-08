import styles from "./page.module.css";

export default function Home() {
  return (
    <main className={styles.main}>
      <h1 className={styles.title}>Backlog Pilot</h1>
      <p className={styles.description}>
        An AI-assisted backlog board. Turn a one-line idea into a user story
        with acceptance criteria, estimate it and spot dependencies, with AI
        helping at every step.
      </p>
    </main>
  );
}
