export default function CenterDiv({ children }) {
  return (
    <>
      <div className="grid justify-center items-center h-screen">
        {children}
      </div>
    </>
  );
}
